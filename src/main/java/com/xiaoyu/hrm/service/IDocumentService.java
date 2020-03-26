package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.Document;
import com.xiaoyu.hrm.pojo.ResultBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;


/**
 * 文档管理
 *
 * @author xiaoyu
 * @date 2020/3/26 15:12
 */
public interface IDocumentService {

    /**
     * 上传文档同时向数据库保存相关信息
     * @param document 信息
     * @param uploadFile 文件信息
     * @return 返回操作结果
     */
    ResultBean insertDocument(Document document, MultipartFile uploadFile);

    /**
     * 根据条件查询文档，条件可有可无
     *
     * @param page 页码
     * @param size 每页行数
     * @param document 条件
     * @return 返回用户信息
     */
    ResultBean findAllDocument(@Param("page") Integer page,
                                   @Param("size") Integer size,
                                   @Param("document") Document document);

    /**
     * 更新文档信息
     * @param document 文档信息
     * @return 返回影响行数
     */
    ResultBean updateDocument(Document document);

    /**
     * 更新id删除文档
     * @param document document
     * @return 返回影响行数
     */
    ResultBean deleteDocument(Document document);

}
