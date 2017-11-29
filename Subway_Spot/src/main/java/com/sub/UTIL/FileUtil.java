package com.sub.UTIL;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

/*
 * �� Ŭ������ ���� ���ε�� �߻��ϴ� 
 * ���� ������ ó���ϱ� ���� �Լ��� ������ ��ƿ��Ƽ Ŭ���� 
 */
public class FileUtil {
	/*
	 * ���� ���ε带 ������ �Լ�
	 */
	public static String upload(MultipartFile oriFile, String name, String path){
		//���ε带 �ǽ��� �� �̸��� �ٲ���������Ƿ� 
		//�̸��� �ٲ� ����� �� �̸��� �޾ƾ� ��Ʈ�ѷ��� ����� �� �ִ�. 
		
		//�Ķ����
		//oriFile: �ӽ� ����� ������ ������ ����ϰ� �ִ� Ŭ���� 
		//name, path: �ӽ� ������ ������ ��ġ�� ������ ������ �̸��� ����� ����
		// ���縦 �ϱ� ���� ���� ������ �̸��� �ߺ��Ǹ� �̸��� �ٲپ ���縦 �ؾ� �Ѵ�.
		name = renameFile(name, path);
		
		//1. ������ ������ File Ŭ������ �����. 
		File copyFile = new File(path+"\\"+name);
		//2. ���縦 �õ� �Ѵ�. 
		try{
			oriFile.transferTo(copyFile);
		}
		catch(Exception e){
			System.out.println("���Ͼ��ε忡��="+e);
			e.printStackTrace();
		}
		return name;
	}
	
	/*
	 * ���ε� �Ҷ� ������ �̸��� �ߺ��Ǵ� ��� ó���� �Լ�
	 * ��, ���� ���ε��� ������ �̸��� �̹� �����ϸ� �̸��� �����ؼ� ������ �������� 
	 * �̸��� ������ �� ����  
	 */
	public static String renameFile(String name, String path){
		//��ȯ��: ����� ���� �̸�
		//�Ķ����: ������ ������ �̸��� ������
		
		//��Ģ �̸��� �ߺ��Ǹ� �̸� �ڿ� _��ȣ�� �̿��ؼ� �̸��� �����ϵ��� �Ѵ�. 
		//��: hong.txt hong(1).txt�� �ٲ� ����
		int count =0;	//�ڿ� ���� ��ȣ�� �����ϱ� ���� ���� 
		String oriName = name;
		File file = new File(path+"\\"+oriName);
		while(file.exists()){	//���� ���ݾ ��ο� ���� �̸����� �������ٵ� �� �̸��� �����ϴ�? 
			//�� ������ �̸��� �ٲ㼭 �˷��־�� �Ѵ�. 
			//����� .�� �̿��ؼ� ���� ����� ���� ������ �и��Ѵ�. 
			//��: hong.txt hong�̶� txt�� �и� �Ѵ�. 
			int pos=name.lastIndexOf(".");	//Ȯ���� �ٷξ��� '.'�� ��ġ�� �˾Ƴ��� 
			String first = name.substring(0, pos);	//'.'���� ���� ��:hong
			String last = name.substring(pos+1);	//'.'���� ���� ��:txt
			
			//2. �� ����� _��ȣ�� �ٿ��� �ٽ� �� �����Ѵ�. 
			count++; //��ȣ�� 1�� �ȴ�. 
			first = first + "(" + count+")";	//���: hong(1)
			oriName = first+"."+last;		//���: hong(1).txt
			
			//�׷��� �� �̸�(hong(1).txt)�� ���� �� �ִ�.
			//�׷��Ƿ� �ٽ� �˻��ϵ��� ����. 
			file = new File(path+"\\"+oriName);	//�ٽ� while���ǹ����� ���ư��� �� �̸��� �����ϴ��� �����. 
		}
		return oriName;	
	}
}