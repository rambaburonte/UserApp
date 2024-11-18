package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	
	public boolean checkCredentials(Integer username, String password) {
        String sql = "SELECT * FROM users WHERE ACCOUNT_ID = ? AND password = ?";
        
        try (Connection connection = DBConnect.getCon();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             
            preparedStatement.setInt(1, username);
            preparedStatement.setString(2, password);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next(); 
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
