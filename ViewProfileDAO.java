package pack1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ViewProfileDAO {
   

   
    public userBean getUserProfile(int accountId) {
    	userBean userProfile = null;
        String SELECT_USER_SQL = "SELECT * FROM users WHERE account_Id = ?";

        try (Connection connection =DBConnect.getCon();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_SQL)) {
            preparedStatement.setInt(1, accountId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                userProfile = new userBean();
                userProfile.setAccountId(resultSet.getInt(1));
                userProfile.setUserFirstName(resultSet.getString(2));
                userProfile.setUserLastName(resultSet.getString(3));
                userProfile.setEmail(resultSet.getString(4));
                userProfile.setProfilePicture(resultSet.getString(5));
                userProfile.setCoverPicture(resultSet.getString(6));
                userProfile.setBioData(resultSet.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userProfile;
    }
}
