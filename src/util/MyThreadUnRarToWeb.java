
package util;
/** 
 * @classname:
 * MyThreadUnRarToWeb
 * @description
 * 解压文件的线程
 * @author 
 * 蓝生 
 * @date：
 * 2011-2-28 上午09:25:57 
 */

public class MyThreadUnRarToWeb extends Thread { 
	private String unrarCode;
	private int time;
	private String path;
	private String unRarPath;
	private String webName;
	public MyThreadUnRarToWeb(String unrarCode,int time,String path,String unRarPath,String webName){
		this.unrarCode = unrarCode;
		this.time = time;
		this.path = path;
		this.unRarPath = unRarPath;
		this.webName = webName;
		
	}
    public void run() { 
            try { 
                Thread.sleep(time); 
                
                RarToFile r = new RarToFile();
        		int result = r.unRARFile(unrarCode,path, unRarPath,webName);
        		while(r.findProcess("UnRar.exe")){
        			Thread.sleep(2000);
        			System.out.println("UnRar.exe 依然存在...");
        		}
        		System.out.println("UnRar.exe ...END");
                System.out.print("线程解压文件睡眠"+time+"毫秒！\n"); 
                Thread.interrupted();//结束进程
            } catch (InterruptedException e) { 
                e.printStackTrace();
                Thread.interrupted();//结束进程
            } 
    } 

//    public static void main(String[] args) { 
//        new MyThread(10000,"","").start(); 
//    } 
}

