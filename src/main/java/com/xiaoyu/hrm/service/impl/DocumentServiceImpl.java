package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IDocumentMapper;
import com.xiaoyu.hrm.pojo.Document;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.ResultPageBean;
import com.xiaoyu.hrm.service.IDocumentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 文档管理
 *
 * @author xiaoyu
 * @date 2020/3/26 15:13
 */
@Service
public class DocumentServiceImpl implements IDocumentService {

    /**
     * 日志
     */
    private final static Logger logger = LoggerFactory.getLogger(DocumentServiceImpl.class);

    @Autowired
    private IDocumentMapper documentMapper;

    /**
     * 文件路径
     */
    @Value("${FILE_PATH}")
    private String FILE_PATH;

    /**
     * 上传文档同时向数据库保存相关信息
     *
     * @param document   信息
     * @param uploadFile 文件信息
     * @return 返回操作结果
     */
    @Override
    public ResultBean insertDocument(Document document, MultipartFile uploadFile) {
        if (uploadFile == null || uploadFile.isEmpty()) {
            return ResultBean.error("上传文件为空！");
        }
        if (document == null || document.getId() != null) {
            return ResultBean.error("保存文档异常！");
        }
        if (StringUtils.isEmpty(document.getRemark())) {
            return ResultBean.error("文档描述不能为空！");
        }
        // 选择保存路径
        String path = FILE_PATH;
        // 判断路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            // 创建该文件夹
            file.mkdirs();
        }

        String fileName = uploadFile.getOriginalFilename();
        String contentType = uploadFile.getContentType();
        Long fileSize = uploadFile.getSize();

        if (StringUtils.isEmpty(fileName)) {
            return ResultBean.error("文档名称不能为空！");
        }
        if (StringUtils.isEmpty(contentType)) {
            return ResultBean.error("获取文档错误！");
        }
        if (fileSize == null || fileSize == 0) {
            return ResultBean.error("获取文档错误！");
        }
        document.setFileType(contentType);
        document.setFileSize(fileSize);
        document.setFilePath(path);
        document.setDelete(false);
        document.setCreateDate(new Date());

        long millis = System.currentTimeMillis();
        fileName = millis + "_" + fileName;
        document.setFileName(fileName);


        // 完成上传
        try {
            uploadFile.transferTo(new File(path, fileName));
        } catch (IOException e) {
            logger.error("用户id：{}, 上传异常", document.getUserId(), e);
            e.printStackTrace();
        }

        int i = documentMapper.insertDocument(document);
        if (i != 1) {
            return ResultBean.error("文档保存失败！");
        }
        logger.info("用户：" + document.getUser().getLoginname() + "-->上传文件：" + document.getFileName(), document);
        return ResultBean.ok("文档上传成功！");
    }

    /**
     * 根据条件查询文档，条件可有可无
     *
     * @param page     页码
     * @param size     每页行数
     * @param document 条件
     * @return 返回用户信息
     */
    @Override
    public ResultBean findAllDocument(Integer page, Integer size, Document document) {
        if (page == null || size == null) {
            return ResultBean.error("查询文件错误！");
        }
        page = (page - 1) * size;
        List<Document> list = documentMapper.findAllDocument(page, size, document);
        if (list == null || list.size() == 0) {
            return ResultBean.error("查询不到文件信息！");
        }
        Long total = documentMapper.getTotal(document);
        return ResultBean.ok(new ResultPageBean(list, total));
    }

    /**
     * 更新文件信息
     *
     * @param document 文件信息
     * @return 返回影响行数
     */
    @Override
    public ResultBean updateDocument(Document document) {
        if (document == null || document.getId() == null) {
            return ResultBean.error("更新操作异常！");
        }
        if (StringUtils.isEmpty(document.getTitle()) || StringUtils.isEmpty(document.getRemark())) {
            return ResultBean.error("请填写文档标题或文档描述！");
        }
        int i = documentMapper.updateDocument(document);
        if (i != 1) {
            return ResultBean.ok("信息未修改！");
        }
        logger.info("用户：" + document.getUser().getLoginname() + "-->修改文件：" + document.getFileName(), document);
        return ResultBean.ok("文件信息修改成功！");
    }

    /**
     * 更新id删除文档
     *
     * @param document document
     * @return 返回影响行数
     */
    @Override
    public ResultBean deleteDocument(Document document) {
        if (document == null || document.getId() == null || StringUtils.isEmpty(document.getFileName())) {
            return ResultBean.error("删除操作异常！");
        }
        // 获取路劲
        String path = FILE_PATH + document.getFileName();
        File file = new File(path);
        //文件是否存在
        if (file.exists()) {

            // 判断数据库是否存在该数据
            Document documentById = documentMapper.findDocumentById(document.getId());
            if (documentById == null) {
                return ResultBean.error("文件删除错误！");
            }
            //存在就删了
            if (file.delete()) {
                int i = documentMapper.deleteDocumentById(document.getId());
                if (i != 1) {
                    return ResultBean.error("文件删除失败！");
                }
                logger.info("用户：" + document.getUser().getLoginname() + "-->删除文件：" + document.getFileName());
                return ResultBean.ok("文件删除成功！");
            }
        }
        return ResultBean.ok("文件删除错误！");
    }
}
