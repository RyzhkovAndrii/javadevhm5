package goit.gojava7.ryzhkov.service.impl;

import goit.gojava7.ryzhkov.model.User;
import goit.gojava7.ryzhkov.repository.UserRepository;
import goit.gojava7.ryzhkov.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public User findById(UUID id) {
        return userRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Collection<User> findAll() {
        return (Collection<User>) userRepository.findAll();
    }

    @Override
    @Transactional
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    @Transactional
    public void removeById(UUID id) {
        userRepository.deleteById(id);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
