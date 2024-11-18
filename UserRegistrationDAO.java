package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserRegistrationDAO {
    

    
    public boolean registerUser(userBean ub) {
        String INSERT_USERS_SQL = "INSERT INTO users  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        boolean rowInserted = false;

        try (Connection connection = DBConnect.getCon()){
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setInt(1, ub.getAccountId());
            preparedStatement.setString(2, ub.getUserFirstName());
            preparedStatement.setString(3, ub.getUserLastName());
            preparedStatement.setString(4, ub.getPassword()); // Ensure to hash passwords before storing in production
            preparedStatement.setString(5, ub.getEmail());
            preparedStatement.setString(6, ub.getProfilePicture());
            preparedStatement.setString(7, ub.getCoverPicture());
            preparedStatement.setString(8, ub.getBioData());

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowInserted;
    }
}
