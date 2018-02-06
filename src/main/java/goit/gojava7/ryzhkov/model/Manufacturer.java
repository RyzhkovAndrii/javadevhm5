package goit.gojava7.ryzhkov.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Set;

@Entity
@Table(name = "manufacturers")
@NoArgsConstructor
@Getter
@Setter
public class Manufacturer extends NamedEntity {

    @OneToMany(mappedBy = "manufacturer", fetch = FetchType.EAGER)
    private Set<Product> products;

}
