package goit.gojava7.ryzhkov.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "roles")
@NoArgsConstructor
@Getter
@Setter
public class Role extends NamedEntity {

    @ManyToMany(mappedBy = "roles", fetch = FetchType.EAGER)
    private Set<User> users;

    public Set<User> getSetUsers() {
        return users;
    }

    public List<User> getUsers() {
        return getSetUsers() != null
                ? new ArrayList<>(getSetUsers())
                : null;
    }

}
