package com.liu.springbootvue.controller.admin;

import com.liu.springbootvue.entity.Result;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class UploadDownController {

    @RequestMapping("/upload")
    public Result upload(@RequestParam("picture")MultipartFile picture, HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File filePath = new File(path);
        System.out.println("文件保存的路径"+path);
        if (!filePath.exists() && !filePath.isDirectory()){
            System.out.println("目录不存在，创建目录"+filePath);
            filePath.mkdir();
        }

        //获取原始文件名称
        String originalFilename = picture.getOriginalFilename();
        System.out.println("原始文件名称"+originalFilename);

        //获取文件类型，以最后一个`.`为标识
        String type = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        System.out.println("文件类型"+type);

        //获取文件名称
        String name = originalFilename.substring(0, originalFilename.lastIndexOf("."));

        //设置值新文件名称:当前时间+文件名称
        Date d =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String data = sdf.format(d);
        String fileName = data+name+"."+type;
        System.out.println("新文件名称"+fileName);

        //在指定路径下创建一个文件
        File targetFile = new File(path,fileName);

        //将文件保存到服务器指定位置
        try {
            picture.transferTo(targetFile);
            System.out.println("上传成功");
            return new Result(true,"/upload/"+fileName);
        }catch (Exception e){
            System.out.println("上传失败");
            e.printStackTrace();
            return new Result(false,"上传失败");
        }
    }

}
