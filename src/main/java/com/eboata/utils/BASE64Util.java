package com.eboata.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class BASE64Util {

	/**
	 * BASE64的字符串转换成图片
	 * 
	 * @param str
	 *            base64的字符串;filePath转换后的图片保存的路径
	 */
	public static void String2Image(String str, String filePath) {
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] bytes = decoder.decodeBuffer(str);

			InputStream bais = new ByteArrayInputStream(bytes);
			BufferedImage bi = ImageIO.read(bais);
			// Image image = Toolkit.getDefaultToolkit().getImage(filePath);
			// BufferedImage bi=toBufferedImage(image);

			File file = new File(filePath);// 可以是jpg,png,gif格式
			ImageIO.write(bi, "jpg", file);// 不管输出什么格式图片，此处不需改动 +
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 图片转换成BASE64的字符串，存储数据库中CLOB
	 */
	public static String Image2String(String filepath) {
		BASE64Encoder encoder = new sun.misc.BASE64Encoder();

		File f = new File(filepath);
		BufferedImage bi;
		try {
			bi = ImageIO.read(f);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(bi, "jpg", baos);
			byte[] bytes = baos.toByteArray();

			return encoder.encodeBuffer(bytes).trim();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}

	public static String getString(String filepath) {
		String str = "";
		byte[] strBuffer = null;
		int flen = 0;
		File file = new File(filepath);
		InputStream in = null;
		try {
			in = new FileInputStream(file);
			flen = (int) file.length();
			strBuffer = new byte[flen];
			in.read(strBuffer, 0, flen);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(in!=null){
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		str = new String(strBuffer); // 构建String时，可用byte[]类型，

		return str;
	}

	/**
	 * 将文件转成base64 字符串
	 * 
	 * @param path文件路径
	 * @return *
	 * @throws Exception
	 */

	public static String encodeBase64File(String path) throws Exception {
		File file = new File(path);
		FileInputStream inputFile = new FileInputStream(file);
		byte[] buffer = new byte[(int) file.length()];
		inputFile.read(buffer);
		inputFile.close();
		return new BASE64Encoder().encode(buffer);

	}

	/**
	 * 将base64字符解码保存文件并返回保存路径
	 * 
	 * @param base64Code
	 * @param targetPath指定文件保存的路径
	 * @throws Exception
	 */

	public static File decoderBase64File(String base64Code, String targetPath) throws Exception {

		byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
		FileOutputStream out = new FileOutputStream(targetPath);
		out.write(buffer);
		File file = new File(targetPath);
		out.close();
		return file;

	}

	//
	// public static BufferedImage toBufferedImage(Image image) {
	// if (image instanceof BufferedImage) {
	// return (BufferedImage)image;
	// }
	//
	// // This code ensures that all the pixels in the image are loaded
	// image = new ImageIcon(image).getImage();
	//
	// // Determine if the image has transparent pixels; for this method's
	// // implementation, see e661 Determining If an Image Has Transparent
	// Pixels
	// //boolean hasAlpha = hasAlpha(image);
	//
	// // Create a buffered image with a format that's compatible with the
	// screen
	// BufferedImage bimage = null;
	// GraphicsEnvironment ge =
	// GraphicsEnvironment.getLocalGraphicsEnvironment();
	// try {
	// // Determine the type of transparency of the new buffered image
	// int transparency = Transparency.OPAQUE;
	// /* if (hasAlpha) {
	// transparency = Transparency.BITMASK;
	// }*/
	//
	// // Create the buffered image
	// GraphicsDevice gs = ge.getDefaultScreenDevice();
	// GraphicsConfiguration gc = gs.getDefaultConfiguration();
	// bimage = gc.createCompatibleImage(
	// image.getWidth(null), image.getHeight(null), transparency);
	// } catch (HeadlessException e) {
	// // The system does not have a screen
	// }
	//
	// if (bimage == null) {
	// // Create a buffered image using the default color model
	// int type = BufferedImage.TYPE_INT_RGB;
	// //int type = BufferedImage.TYPE_3BYTE_BGR;//by wang
	// /*if (hasAlpha) {
	// type = BufferedImage.TYPE_INT_ARGB;
	// }*/
	// bimage = new BufferedImage(image.getWidth(null), image.getHeight(null),
	// type);
	// }
	//
	// // Copy image to buffered image
	// Graphics g = bimage.createGraphics();
	//
	// // Paint the image onto the buffered image
	// g.drawImage(image, 0, 0, null);
	// g.dispose();
	//
	// return bimage;
	// }
	//
	//
}
