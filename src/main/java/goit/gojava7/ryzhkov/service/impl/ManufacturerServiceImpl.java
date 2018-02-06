package goit.gojava7.ryzhkov.service.impl;

import goit.gojava7.ryzhkov.model.Manufacturer;
import goit.gojava7.ryzhkov.repository.ManufacturerRepository;
import goit.gojava7.ryzhkov.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

@Service
public class ManufacturerServiceImpl implements ManufacturerService {

    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Override
    @Transactional
    public Manufacturer findById(UUID id) {
        return manufacturerRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Collection<Manufacturer> findAll() {
        return (Collection<Manufacturer>) manufacturerRepository.findAll();
    }

    @Override
    @Transactional
    public void save(Manufacturer manufacturer) {
        manufacturerRepository.save(manufacturer);
    }

    @Override
    @Transactional
    public void removeById(UUID id) {
        manufacturerRepository.deleteById(id);
    }

}
