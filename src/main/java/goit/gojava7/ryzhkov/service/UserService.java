package goit.gojava7.ryzhkov.service;

import goit.gojava7.ryzhkov.model.User;

import java.util.UUID;

public interface UserService extends GenericService<User, UUID> {

    User findByEmail(String email);

}
