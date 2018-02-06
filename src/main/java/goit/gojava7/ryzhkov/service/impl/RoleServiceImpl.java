package goit.gojava7.ryzhkov.service.impl;

import goit.gojava7.ryzhkov.model.Role;
import goit.gojava7.ryzhkov.repository.RoleRepository;
import goit.gojava7.ryzhkov.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    @Transactional
    public Role findById(UUID id) {
        return roleRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Collection<Role> findAll() {
        return (Collection<Role>) roleRepository.findAll();
    }

    @Override
    @Transactional
    public void save(Role role) {
        roleRepository.save(role);
    }

    @Override
    @Transactional
    public void removeById(UUID id) {
        roleRepository.deleteById(id);
    }

}
