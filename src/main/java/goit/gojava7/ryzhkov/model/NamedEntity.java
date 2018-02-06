package goit.gojava7.ryzhkov.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
@Getter
@Setter
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public abstract class NamedEntity extends BaseEntity {

    @Column(name = "name", nullable = false, unique = true)
    private String name;

}
