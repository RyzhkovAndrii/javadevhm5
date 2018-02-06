package goit.gojava7.ryzhkov.service;

import goit.gojava7.ryzhkov.model.BaseEntity;

import java.util.Collection;

public interface GenericService<T extends BaseEntity, ID> {

    T findById(ID id);

    Collection<T> findAll();

    void save(T t);

    void removeById(ID id);

}
