package goit.gojava7.ryzhkov.repository;

import goit.gojava7.ryzhkov.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UserRepository extends CrudRepository<User, UUID> {

    User findByEmail(String email);

}
