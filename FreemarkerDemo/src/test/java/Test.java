import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.FileWriter;
import java.util.*;

public class Test {


    public static void main(String[] args)  throws Exception{
        Configuration configuration = new Configuration(Configuration.getVersion());
        //设置模板所在目录
        configuration.setDirectoryForTemplateLoading(new File(".\\src\\main\\resources"));
        //设置字符集
        configuration.setDefaultEncoding("utf-8");
        //加载模板
        Template template = configuration.getTemplate("test.ftl");
        //创建数据模型
        Map map = new HashMap();
        map.put("name", "学员");
        map.put("message", "欢迎来优就业学习！");

        map.put("success", true);


        List goodsList=new ArrayList();
        Map goods1=new HashMap();
        goods1.put("name", "苹果");
        goods1.put("price", 5.8);
        Map goods2=new HashMap();
        goods2.put("name", "香蕉");
        goods2.put("price", 2.5);
        Map goods3=new HashMap();
        goods3.put("name", "橘子");
        goods3.put("price", 3.2);
        goodsList.add(goods1);
        goodsList.add(goods2);
        goodsList.add(goods3);
        map.put("goodsList", goodsList);



        map.put("today", new Date());

        map.put("point", 102920122);

        //创建Writer对象
        FileWriter out = new FileWriter(new File(".\\src\\main\\resources\\demo.html"));
        //输出
        template.process(map, out);
        System.out.println("生成成功");
        //关闭输出流
        out.close();
    }
}
