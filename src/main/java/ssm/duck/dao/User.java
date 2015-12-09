package ssm.duck.dao;

public class User {
    private int id;
    private String name;
    private String email;
    private String content;

    public User() {
           super();
    }

    public User(int id, String name, String email, String content) {
           super();
           this.id = id;
           this.name = name;
           this.email = email;
           this.content = content;
    }

    public int getId() {
           return id;
    }

    public void setId(int id) {
           this.id = id;
    }

    public String getName() {
           return name;
    }

    public void setName(String name) {
           this.name = name;
    }

    public String getEmail() {
           return email;
    }

    public void setEmail(String email) {
           this.email = email;
    }

    public String getContent() {
           return content;
    }

    public void setContent(String content) {
           this.content = content;
    }
}