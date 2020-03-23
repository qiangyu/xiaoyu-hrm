package com.xiaoyu.hrm;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.mapper.IDepartmentMapper;
import com.xiaoyu.hrm.pojo.Department;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.UUID;

@SpringBootTest
class XiaoyuHrmApplicationTests {

    @Autowired
    private JedisUtil jedisUtil;

    @Autowired
    private IDepartmentMapper departmentMapper;

    @Test
    void contextLoads() {

    }

    /*public static final Object parse(String text); // 把JSON文本parse为JSONObject或者JSONArray
    public static final JSONObject parseObject(String text)； // 把JSON文本parse成JSONObject
    public static final <T> T parseObject(String text, Class<T> clazz); // 把JSON文本parse为JavaBean
    public static final JSONArray parseArray(String text); // 把JSON文本parse成JSONArray
    public static final <T> List<T> parseArray(String text, Class<T> clazz); //把JSON文本parse成JavaBean集合
    public static final String toJSONString(Object object); // 将JavaBean序列化为JSON文本
    public static final String toJSONString(Object object, boolean prettyFormat); // 将JavaBean序列化为带格式的JSON文本
    public static final Object toJSON(Object javaObject); //将JavaBean转换为JSONObject或者JSONArray。*/

    /**
     * 测试缓存
     */
    @Test
    void testRedis() {
        String uuid = UUID.randomUUID().toString().replace("-", "");
        User user = new User();
        user.setUsername("xiaoyu");
        String s = JSON.toJSONString(user);
        jedisUtil.set("xiaoyu:" +uuid, s);
    }

    /**
     * 测试部门更新，测试影响的行数
     */
    @Test
    void testAddDepartment() {
        Department department = new Department();
        department.setId(127);
//        department.setName("4");
//        department.setRemark("1");
//        department.setParentId(6);
//        department.setDepPath(".1.4");
//        department.setEnabled(true);
//        department.setParent(false);
        int i = departmentMapper.updateDepPathById(department);
        System.out.println(i);
    }
}
