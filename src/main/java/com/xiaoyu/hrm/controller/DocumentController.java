package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.Document;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.IDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * 处理文档请求
 *
 * @author xiaoyu
 * @date 2020/3/26 10:39
 */
@RestController
@RequestMapping("/document/basic")
public class DocumentController {

    @Autowired
    private IDocumentService documentService;

    @Value("${FILE_PATH}")
    private String FILE_PATH;

    /**
     * 根据条件查询文档，条件可有可无
     *
     * @param document 条件（title）
     * @return 返回查询的结果
     */
    @GetMapping("/")
    public ResultBean findAllDocument(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "10") Integer size,
                                      Document document) {
        return documentService.findAllDocument(page, size, document);
    }

    /**
     * 上传文档同时向数据库保存相关信息
     *
     * @param document   信息
     * @param uploadFile 文件信息
     * @return 返回操作结果
     */
    @PostMapping("/")
    public ResultBean addDocument(HttpServletRequest request,
                                  Document document,
                                  @RequestParam("file") MultipartFile uploadFile) {
        User user = (User) request.getAttribute("user");
        document.setUser(user);
        document.setUserId(user.getId());
        System.out.println(document + "文档");
        return documentService.insertDocument(document, uploadFile);
    }

    /**
     * 更新文档信息
     *
     * @param document 文档信息
     * @return 返回影响行数
     */
    @PutMapping("/")
    public ResultBean powerUpdateDocument(@RequestBody Document document) {
        return documentService.updateDocument(document);
    }

    /**
     * 根据id删除文档
     *
     * @param document document
     * @return 返回影响行数
     */
    @DeleteMapping("/")
    public ResultBean powerDeleteDocument(@RequestBody Document document) {
        return documentService.deleteDocument(document);
    }

    /**
     * 下载文件
     *
     * @param fileName 文件名
     * @param response response
     */
    @GetMapping("/download")
    public void downloadDocument(String fileName,
                                 HttpServletResponse response) {
        // 如果文件名不为空，则进行下载
        if (fileName != null) {
            String path = FILE_PATH + fileName;
            File file = new File(path);
            // 如果文件存在，则进行下载
            if (file.exists()) {
                // 配置文件下载
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    response.setHeader("content-type", "application/octet-stream");
                    response.setContentType("application/octet-stream");
                    // 下载文件能正常显示中文
                    response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
                    // 实现文件下载
                    byte[] buffer = new byte[1024];
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                    System.out.println("Download  successfully!");
                } catch (Exception e) {
                    System.out.println("Download  failed!");
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }

}
