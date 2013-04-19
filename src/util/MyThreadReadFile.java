package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.jrtcms.web.pojo.NewsTemplate;
import com.jrtcms.web.service.NewsTemplateService;

/**
 * @classname:
 * MyThreadReadFile
 * @description
 *  读取文件夹下的文件线程
 * @author 蓝生
 * @date： 2011-2-28 上午09:25:57
 */

public class MyThreadReadFile extends Thread {
	private int time;
	private NewsTemplateService newsTemplateService;
	private String path;
	private String relepath;
	private String webName;
	private Long websiteurl_id;

	public MyThreadReadFile(int time, NewsTemplateService newsTemplateService,
			String path,String relepath,String webName,Long websiteurl_id) {
		this.time = time;
		this.newsTemplateService = newsTemplateService;
		this.path = path;
		this.relepath = relepath;
		this.webName = webName;
		this.websiteurl_id = websiteurl_id;
		

	}

	public void run() {
		try {
			Thread.sleep(time);
			System.out.println("relepath:>>:"+relepath);
			List fileList = readfile(relepath);
			if (fileList != null && fileList.size() > 0) {
				for (int i = 0; i < fileList.size(); i++) {
					// 如果是jsp文件则保存到数据库中
					if (fileList.get(i).toString().indexOf(".jsp") > -1) {
						NewsTemplate newsTem =newsTemplateService.queryByName(fileList.get(i).toString());
						if(newsTem == null){
							NewsTemplate newsTemplate = new NewsTemplate();
							newsTemplate.setName(fileList.get(i).toString());// 文件名
							newsTemplate.setAdderss(path);
							newsTemplate.setShowflag(0);
							newsTemplate.setStatus(0);
							newsTemplate.setCode(relepath);
							newsTemplate.setWebsiteurl_id(websiteurl_id);
							newsTemplateService.addNewsTemplate(newsTemplate);
						}
					}
					System.out.println("线程读取文件 "+i);
				}
			}
			System.out.println("线程读取文件完毕！");
			Thread.interrupted();//结束进程
		} catch (InterruptedException e) {
			e.printStackTrace();
			Thread.interrupted();//结束进程
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			Thread.interrupted();//结束进程
		} catch (IOException e) {
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
		List fileList = new ArrayList();
		try {
			File file = new File(filepath);
			if (!file.isDirectory()) {
				System.out.println("文件");
				System.out.println("path=" + file.getPath());
				System.out.println("absolutepath=" + file.getAbsolutePath());
				System.out.println("name=" + file.getName());

			} else if (file.isDirectory()) {
				System.out.println("文件夹");
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File readfile = new File(filepath + File.separator + filelist[i]);
					if (!readfile.isDirectory()) {
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
		return fileList;
	}
}
