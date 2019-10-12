package br.com.trips.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.EnumMap;
import java.util.Map;
 
import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@Service
public class QRCodeService {
	
	/*Metodo que gera o QRCode recebendo por parametro o id do usuario e id da viagem para verificacao e converte o qr para Base64*/
	public String geraQRCode(Long idUsuario, Long idViagem) {
		String texto = idUsuario + "," + idViagem;
		int tamanho = 250;
		String formato = "png";
		String qrBase64 = null;
		try {
			
			Map<EncodeHintType, Object> hintMap = new EnumMap<EncodeHintType, Object>(EncodeHintType.class);
			hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			hintMap.put(EncodeHintType.MARGIN, 1);
			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix byteMatrix = qrCodeWriter.encode(texto, BarcodeFormat.QR_CODE, tamanho, tamanho, hintMap);
			int width = byteMatrix.getWidth();
			BufferedImage image = new BufferedImage(width, width,
					BufferedImage.TYPE_INT_RGB);
			image.createGraphics();

			Graphics2D graphics = (Graphics2D) image.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, width, width);
			graphics.setColor(Color.BLACK);

			for (int i = 0; i < width; i++) {
				for (int j = 0; j < width; j++) {
					if (byteMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}
			ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
			ImageIO.write(image, formato, pngOutputStream);
			
			byte[] arquivoByte = pngOutputStream.toByteArray();
			String convertidoBase64 = Base64.getEncoder().encodeToString(arquivoByte);
			qrBase64 = convertidoBase64;
			System.out.println(qrBase64);
			System.out.println(texto);
			return qrBase64;
			
		} catch (WriterException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return qrBase64;
	}
}
