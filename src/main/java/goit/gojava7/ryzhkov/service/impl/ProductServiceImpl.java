package goit.gojava7.ryzhkov.service.impl;

import goit.gojava7.ryzhkov.model.Product;
import goit.gojava7.ryzhkov.repository.ProductRepository;
import goit.gojava7.ryzhkov.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional
    public Product findById(UUID id) {
        return  productRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Collection<Product> findAll() {
        return (Collection<Product>) productRepository.findAll();
    }

    @Override
    @Transactional
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    @Transactional
    public void removeById(UUID id) {
        productRepository.deleteById(id);
    }

}
