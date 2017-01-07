package com.nateiot.cis.common;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import com.nateiot.cis.domain.Dianying;

public class IOUtil {
	private static ThreadPoolExecutor pool = new ThreadPoolExecutor(4, 4, 200, 
			TimeUnit.MILLISECONDS, new LinkedBlockingQueue<Runnable>());
	
	private static int lidu = 50;
	private static final Random random = new Random(); 
	
	private static String panfu = "d";
	private static String configFilePath = panfu + ":/wane/xieer.config";
	private static String outputFilePath = panfu + ":/wane/java/data";
	private static String menuFilePath = panfu + ":/wane/menu.txt";
	
	public static synchronized void resetMenu(String fileName) throws IOException{
		File menu = new File(menuFilePath);
		BufferedWriter bw = new BufferedWriter(new FileWriter(menu, true));
		if(menu.exists()){
			bw.newLine();
		}
		bw.write(new Date().toString()+ " " + fileName);
		bw.close();
	}
	
	public static boolean copy(String resource, String target){
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(resource);
			File copy = new File(target);
			is = new BufferedInputStream(new FileInputStream(file));
			os = new BufferedOutputStream(new FileOutputStream(copy));	
			
			byte b[] = new byte[1024];
			int length = 0;
			while ((length = is.read(b, 0, b.length)) != -1) {				
				os.write(b, 0, length);
			}
			System.out.println("copy wenjian："+ copy.getPath());
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public static void pohuai(String filePath) throws Exception{
		File file = new File(filePath);
		File copy = new File(file.getPath() +".data");
		InputStream is = new BufferedInputStream(new FileInputStream(file));
		OutputStream os = new BufferedOutputStream(new FileOutputStream(copy));
		
		lidu = new Random().nextInt(lidu) + 10;
		os.write(lidu);
		
		byte b[] = new byte[lidu];
		int length = 0;
		while ((length = is.read(b, 0, b.length)) != -1) {				
			os.write(b, 0, length);
			os.write(random.nextInt());
		}
		
		is.close();
		os.close();
		new File(filePath).delete();
		System.out.println("chenggong pohuai wenjian："+ copy.getPath());
	}
	
	public static void xiufu(String filePath){
		if(! filePath.endsWith(".data")){
			return;
		}
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(filePath);
			File parent = file.getParentFile();
			String fileName = file.getName();
			fileName = "xiufu-" + fileName.substring(0, fileName.length() - 5);
			File copy = new File(parent.getPath() +"/"+ fileName);
			
			is = new BufferedInputStream(new FileInputStream(file));
			os = new BufferedOutputStream(new FileOutputStream(copy));
			lidu = is.read();
			byte b[] = new byte[lidu + 1];
			int length = 0;
			while ((length = is.read(b, 0, b.length)) != -1) {				
				os.write(b, 0, length - 1);
			}
			System.out.println("");
			System.out.println("");
			System.out.println("");
			System.out.println("wenjian xiufu chenggong:"+ copy.getPath());

		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public static boolean copyToSD(Dianying dy, String sd){
		String url = dy.getUrl()+ ".data";
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(url);
			File copy = new File(sd +":/xiaoniu/dianying/"+ dy.getName() +"."+ dy.getGeshi());
			
			is = new BufferedInputStream(new FileInputStream(file));
			os = new BufferedOutputStream(new FileOutputStream(copy));
			
			//读取粒度大小
			lidu = is.read();
			byte b[] = new byte[lidu + 1];
			int length = 0;
			while ((length = is.read(b, 0, b.length)) != -1) {				
				os.write(b, 0, length - 1);
			}
			System.out.println("");
			System.out.println("");
			System.out.println("");
			System.out.println("wenjian xiufu chenggong:"+ copy.getPath());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			try {
				is.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void jiamis(File file){
		if(file.isFile()){
			Runnable task = new JiamiTask(file.getPath());
			pool.execute(task);
		}
		if(file.isDirectory()){
			File files[] = file.listFiles();
			for(int i = 0; i < files.length; i ++){
				jiamis(files[i]);
			}
		}
	}
	
	public static void jiemis(File file){
		if(file.isFile()){
			Runnable task = new JiemiTask(file.getPath());
			pool.execute(task);
		}
		if(file.isDirectory()){
			File files[] = file.listFiles();
			for(int i = 0; i < files.length; i ++){
				jiemis(files[i]);
			}
		}
	}
	
	public static void silies(File file){
/*		if(file.isFile()){
			Runnable task = new SilieTask(file.getPath());
			pool.execute(task);
		}*/
		if(file.isDirectory()){
			File files[] = file.listFiles();
			for(int i = 0; i < files.length; i ++){
//				silies(files[i]);
				try {
					IOUtil.silie(files[i].getPath(), "");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static String silie(String path, String outputPath) throws Exception{
		File file = new File(path);
		if(! file.isFile()){
			return "";
		}
		
		Long time = System.currentTimeMillis();
		StringBuffer names = new StringBuffer();
		InputStream is = new BufferedInputStream(new FileInputStream(file));
		
		File newFile = new File(outputPath.length() == 0 ? outputFilePath : outputPath);
		if(! newFile.exists()){
			newFile.mkdirs();
		}
		
		String newName = random.nextInt(100000) + ""+ random.nextInt(100000) + ".data";
		names.append(newName + ",");
		
		newName = newFile.getPath() +"/"+ newName;
		OutputStream os = new BufferedOutputStream(new FileOutputStream(new File(newName)));
		
		
		byte b[] = new byte[1024];
		int length = 0;
		int biaozhi = 0;
		
		while((length = is.read(b, 0, b.length)) != -1){
			os.write(b, 0, length);
			if( (++ biaozhi) == 102400 ){
				os.close();
				biaozhi = 0;
				newName = random.nextInt(100000) + ""+ random.nextInt(100000) + ".data";
				names.append(newName + ",");
				newName = newFile.getPath() +"/"+ newName;
				os = new BufferedOutputStream(new FileOutputStream(new File(newName)));
			}
		}
			
		if(is != null)
			is.close();
		
		if(os != null)
			os.close();
		file.delete();
		time = System.currentTimeMillis() - time;
		System.out.println("chuili wanbi, yonshi："+ time +" haomiao");
		return names.toString();
	}
	
	public static void hebin(String key, String path){
		outputFilePath = path.length() == 0 ? outputFilePath : path;
		File file = new File(outputFilePath);
		if(file.isFile()){
			return;
		}
//		String value = getConfigBy(createKey(key));
		String value = getConfigBy(key);
		String fileNameArry[] = value.split(",");
		
		InputStream is = null;
		OutputStream os = null;
		try{
			//合并后的文件的绝对路径
			String newPath = file.getPath() + "/"+ key;
			File newFile = new File(newPath);
			os = new BufferedOutputStream(new FileOutputStream(newFile));
			
			byte b[] = new byte[1024];
			int length = 0;
			
			for(int i = 0; i < fileNameArry.length; i ++){
				File tempFile = new File(outputFilePath +"/"+fileNameArry[i]);
				is = new BufferedInputStream(new FileInputStream(tempFile));
				while((length = is.read(b, 0, b.length)) != -1){
					os.write(b, 0, length);
				}
				is.close();
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(is != null)
					is.close();
				
				if(os != null)
					os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * @param entity 下载文件的实体
	 * @param parentUrl 碎片文件所在文件夹的路径
	 * @param suipians 碎片文件名称字符串集合
	 * @param sdPanfu  sd卡插上电脑后其盘符
	 */
	public static boolean copyToSD(Dianying entity, String parentUrl, String suipians, String sdPanfu){
		File file = new File(outputFilePath);
		if(file.isFile()){
			return false;
		}
		
		String fileNameArry[] = suipians.split(",");
		
		InputStream is = null;
		OutputStream os = null;
		try{
			//合并后的文件的绝对路径
			String name = sdPanfu + ":/xiaoniu/dianying/"+ entity.getName() +"."+ entity.getGeshi();
			File newFile = new File(name);
			os = new BufferedOutputStream(new FileOutputStream(newFile));
			
			byte b[] = new byte[1024];
			int length = 0;
			
			for(int i = 0; i < fileNameArry.length; i ++){
				File tempFile = new File(parentUrl +"/"+fileNameArry[i]);
				is = new BufferedInputStream(new FileInputStream(tempFile));
				while((length = is.read(b, 0, b.length)) != -1){
					os.write(b, 0, length);
				}
				is.close();
			}
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try {
				if(is != null)
					is.close();
				
				if(os != null)
					os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	public static void delSilieFile(String key, String path){
		outputFilePath = path.length() == 0 ? outputFilePath : path;
		File file = new File(outputFilePath);
		if(file.isFile()){
			return;
		}
//		String value = getConfigBy(createKey(key));
		String value = getConfigBy(key);
		String fileNameArry[] = value.split(",");
	
		for(int i = 0; i < fileNameArry.length; i ++){
			File tempFile = new File(outputFilePath +"/"+fileNameArry[i]);
			tempFile.delete();
		}
		removeConfigBy(key);
	}
	
	
	private static String getConfigBy(String key){
		Properties pro = new Properties();
		try {
			pro.load(new BufferedInputStream(new FileInputStream(new File(configFilePath))));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro.getProperty(key);
	}
	
	private static void removeConfigBy(String key){
		Properties pro = new Properties();
		OutputStream os = null;
		try {
			pro.load(new BufferedInputStream(new FileInputStream(new File(configFilePath))));
			pro.remove(key);
			os = new FileOutputStream(new File(configFilePath));
			pro.store(os, "Update config");
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void setConfig(String key, String value) throws IOException{
		Properties pro = new Properties();
		OutputStream os = null;
		try {
			File file = new File(configFilePath);
			
			if(! file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			
			if(! file.exists()){
				os = new FileOutputStream(file);
				os.close();
			}
			
			pro.load(new FileInputStream(file));
			pro.setProperty(key, value);
			os = new FileOutputStream(file);
			pro.store(os, "Update config");
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(os != null) os.close();
		}
	}
	
	private static String createKey(String fileName){
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < fileName.length(); i ++){
			int a = fileName.charAt(i);
			sb.append(a + "");
		}
		return sb.toString();
	}
	
	/**
     * 关闭一个或多个流对象
     * 
     * @param closeables
     *            可关闭的流对象列表
     * @throws IOException
     */
    public static void close(Closeable... closeables) throws IOException {
        if (closeables != null) {
            for (Closeable closeable : closeables) {
                if (closeable != null) {
                    closeable.close();
                }
            }
        }
    }
 
    /**
     * 关闭一个或多个流对象
     * 
     * @param closeables
     *            可关闭的流对象列表
     */
    public static void closeQuietly(Closeable... closeables) {
        try {
            close(closeables);
        } catch (IOException e) {
            // do nothing
        }
    }
	
}

class JiamiTask implements Runnable{

	private String path;
	public JiamiTask(String path){
		this.path = path;
	}
	
	@Override
	public void run() {
		try {
			IOUtil.pohuai(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}


class JiemiTask implements Runnable{

	private String path;
	public JiemiTask(String path){
		this.path = path;
	}
	
	@Override
	public void run() {
		IOUtil.xiufu(path);
	}
}

class SilieTask implements Runnable{
	private String path;
	public SilieTask(String path){
		this.path = path;
	}
	@Override
	public void run() {
		try {
			IOUtil.silie(path, "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
