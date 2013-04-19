
package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.service.NewsTemplateService;

/** 
 * @classname:
 * MyThreadUnRar
 * @description
 * 解压文件的线程
 * @author 
 * 蓝生 
 * @date：
 * 2011-2-28 上午09:25:57 
 */

public class MyThreadUnRar extends Thread { 
	private String unrarCode;
	private int time;
	private String path;
	private String unRarPath;
	private NewsTemplateService newsTemplateService;
	private String relepath;
	private Long websiteurl_id;
	private String websitename;
	private String copyfrom;
	private String copyPath;
	private String copyCode;
	private String unRarExeCode;
	private static List fileList = new ArrayList();
	private static Map fileMap = new HashMap();
	public MyThreadUnRar(String unrarCode,int time,String path,String unRarPath,
			NewsTemplateService newsTemplateService,String relepath,
			Long websiteurl_id,String websitename,String copyfrom,String copyPath,String copyCode,String unRarExeCode){
		this.unrarCode = unrarCode;
		this.time = time;
		this.path = path;
		this.unRarPath = unRarPath;
		this.newsTemplateService = newsTemplateService;
		this.relepath = relepath;
		this.websiteurl_id = websiteurl_id;
		this.websitename = websitename;
		this.copyfrom = copyfrom;
		this.copyPath = copyPath;
		this.copyCode = copyCode;
		this.unRarExeCode = unRarExeCode;
		
		
	}
    public void run() { 
            try { 
                Thread.sleep(time); 
                Long sart = System.currentTimeMillis();
                RarToFile r = new RarToFile();
        		int result = r.unRARFile(unrarCode,path, unRarPath,websitename);
        		while(r.findProcess(unRarExeCode)){
        			Thread.sleep(100); 
        			System.out.println("sleep");
        		}
        		List fileList = readfile(relepath);
        		Map fileMap = readfileMap(relepath);
        		Runtime rt = Runtime.getRuntime();   
                Process p = rt.exec(copyCode+copyfrom+" "+copyPath);
    			if (fileList != null && fileList.size() > 0) {
    				for (int i = 0; i < fileList.size(); i++) {
    					// 如果是jsp文件则保存到数据库中
    					if (fileList.get(i).toString().indexOf(websitename+"_")>-1 && fileList.get(i).toString().indexOf(".jsp") > -1) {
    						String code = (String)fileMap.get(fileList.get(i).toString());
    						NewsTemplate newsTem =newsTemplateService.queryByName(fileList.get(i).toString());
    						if(newsTem == null){
    							NewsTemplate newsTemplate = new NewsTemplate();
    							newsTemplate.setName(fileList.get(i).toString());// 文件名
    							newsTemplate.setAdderss(code.substring(code.indexOf("template"), code.length()).replaceAll("\\\\", "/"));
    							newsTemplate.setShowflag(0);
    							newsTemplate.setStatus(0);
    							/**
    							 * 模板类型  -1默认模版 0首页模板 1 频道模板 2 分类模板 3新闻模板 4 定时器模板 5通用模板 6引用模版7频道分类联合模板
    							 */
    							int type = -1;
    							if(fileList.get(i).toString().indexOf(websitename+"_index.jsp")>-1 ){
    								type = 0;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_category_")>-1 ){
    								type = 2;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_channel_")>-1 ){
    								type = 1;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_channel_category_")>-1 ){
    								type = 7;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_news")>-1 ){
    								type = 3;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_include_")>-1 ){
    								type = 6;
    							}
    							if(fileList.get(i).toString().indexOf(websitename+"_include_common_")>-1 ){
    								type = 5;
    							}
    							newsTemplate.setType(type);
    							newsTemplate.setCode(code);
    							newsTemplate.setWebsiteurl_id(websiteurl_id);
    							newsTemplateService.addNewsTemplate(newsTemplate);
    						}else{
    							NewsTemplate newsTemplate = newsTem;
    							newsTemplate.setName(fileList.get(i).toString());// 文件名
    							newsTemplate.setAdderss(code.substring(code.indexOf("template"), code.length()).replaceAll("\\\\", "/"));
    							newsTemplate.setCode(code);
    							newsTemplate.setWebsiteurl_id(websiteurl_id);
    							newsTemplateService.eidt(newsTemplate);
    						}
    					}
    					System.out.println("线程读取文件 "+i);
    				}
    			}
        		System.out.println("UnRar.exe ...END");
        		System.out.println(copyCode+copyfrom+" "+copyPath);
        		Long end = System.currentTimeMillis();
                System.out.print("线程解压文件："+(end-sart)+"毫秒！\n");
                Thread.interrupted();//结束进程
            } catch (InterruptedException e) { 
                e.printStackTrace(); 
                Thread.interrupted();//结束进程
            } catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Thread.interrupted();//结束进程
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Thread.interrupted();//结束进程
			} 
    } 
    /**
	 * 读取文件夹下所有文件，返回文件名的list
	 * @param filepath 文件夹路径
	 * @return 返回文件名的list
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static List readfile(String filepath) throws FileNotFoundException,
			IOException {
		
		try {
			File file = new File(filepath);
			if (!file.isDirectory()) {
				System.out.println("文件");
				System.out.println("path=" + file.getPath());
				System.out.println("absolutepath=" + file.getAbsolutePath());
				System.out.println("name=" + file.getName());

			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File readfile = new File(filepath + File.separator + filelist[i]);
					if (!readfile.isDirectory()) {
						System.out.println("path=" + file.getPath());
						System.out.println("name=" + readfile.getName());
						fileList.add(readfile.getName());
					} else if (readfile.isDirectory()) {
						readfile(filepath + File.separator + filelist[i]);
					}
				}

			}

		} catch (FileNotFoundException e) {
			System.out.println("readfile() Exception:" + e.getMessage());
		}
		System.out.println(fileList.size());
		return fileList;
	}
	public static Map readfileMap(String filepath) throws FileNotFoundException,
	IOException {
		
		try {
			File file = new File(filepath);
			if (!file.isDirectory()) {
				System.out.println("文件");
				System.out.println("path=" + file.getPath());
				System.out.println("absolutepath=" + file.getAbsolutePath());
				System.out.println("name=" + file.getName());
				
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File readfile = new File(filepath + File.separator + filelist[i]);
					if (!readfile.isDirectory()) {
						System.out.println("path=" + file.getPath());
						System.out.println("name=" + readfile.getName());
						fileMap.put(readfile.getName(), file.getPath());
					} else if (readfile.isDirectory()) {
						readfileMap(filepath + File.separator + filelist[i]);
					}
				}
				
			}
			
		} catch (FileNotFoundException e) {
			System.out.println("readfile() Exception:" + e.getMessage());
		}
		System.out.println(fileMap.size());
		return fileMap;
	}


}
