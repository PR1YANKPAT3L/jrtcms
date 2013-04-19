
package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ResourceBundle;

/** 
 * @classname:
 * RarToFile
 * @description
 * 解压文件工具
 * @author 
 * 蓝生 
 * @date：
 * 2011-2-17 下午05:11:57 
 */

public class RarToFile {   
    /*  
     * cmd 压缩命令  
     */  
//     private static String rarCmd = "C:\\Program Files\\WinRAR\\Rar.exe a ";    
     /*  
      * cmd 解压缩命令  
      */
//     private static String unrarCmd = "C:\\Program Files\\WinRAR\\UnRar x ";      
   
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	//监控命令：tasklist /FI \"IMAGENAME eq 
	private static String findProcess = rbint.getString("findProcess");
   
    /**
     * 将1个RAR文件解压     
     * @param rarFileName 需要解压的RAR文件(必须包含路径信息以及后缀)
     * @param destDir 解压后的文件放置目录 
     */
     public  int unRARFile(String unrarCode,String rarFileName, String destDir,String websitename) {   
        
    	String unrarCmd = unrarCode.replace("{zipfile}", rarFileName).replace("{file}", destDir).replace("{websitename}", websitename); // unrarCode + rarFileName + " " + destDir;
    	/* 判断路径是否存在 不存在就自动创建 begin */
		File fd = null;
		try {
			fd = new File(destDir);
			if (!fd.exists()) { 
				fd.mkdirs();// 路径不存,自动创建
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fd = null;
		}
		/* 判断路径是否存在 不存在就自动创建 end */
        System.out.println("-->"+unrarCmd);
        int result = 0;
        try {   
            Runtime rt = Runtime.getRuntime();   
            Process p = rt.exec(unrarCmd);
            result = 1;
        } catch (Exception e) {   
            System.out.println(e.getMessage());
            result = 0;
        }finally{
        	return result;
        }
     }   
     
     
	public static boolean findProcess(String processName) {
		BufferedReader br = null;
		try {
			// 下面这句是列出含有processName的进程图像名
			Process proc = Runtime.getRuntime().exec(findProcess + processName + "\"");
			br = new BufferedReader(new InputStreamReader(proc.getInputStream()));
			String line = null;
			while ((line = br.readLine()) != null) {
				// 判断指定的进程是否在运行
				System.out.println("line:"+line);
				if (line.contains(processName)) {
					return true;
				}
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (Exception ex) {
				}
			}

		}
	}

   public static void main(String[] args) {
	   System.out.println("--------");
	    RarToFile r=new RarToFile();
	    r.unRARFile("C:\\Program Files\\WinRAR\\UnRar.exe x -o+ -ad ","D:/aa.rar", "D:/template","ruyicai");
 }
}  


