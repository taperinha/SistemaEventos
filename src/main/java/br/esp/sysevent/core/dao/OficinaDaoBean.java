/*
 * Sistema de Eventos - Core - Copyright (c) 2013 TaperinhaSoft. All rights reserved.
 */
package br.esp.sysevent.core.dao;

import br.esp.sysevent.core.model.Oficina;
import java.util.Collection;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Alexander Fiabane do Rego (alexanderfiabane@yahoo.com.br)
 */
@Repository(value = "oficinaDao")
public class OficinaDaoBean extends AbstractBaseSistemaDaoBean<Long, Oficina> implements OficinaDao {

    @Autowired
    public OficinaDaoBean(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    @Override
    public Collection<Oficina> findAll() {
        return super.findAll(new Order[]{Order.asc("nome")});
    }
}
