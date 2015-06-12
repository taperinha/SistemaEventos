/*
 * Copyright (c) 2009-2013 CPD-UFSM. All rights reserved.
 */
package br.esp.sysevent.web.ajax;

import br.esp.sysevent.core.dao.CidadeDao;
import br.esp.sysevent.core.model.Cidade;
import java.util.Collection;
import java.util.Collections;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Giuliano Ferreira <giuliano@ufsm.br>
 */
@RemoteProxy
public class EnderecoAjaxService {

    @Autowired
    private CidadeDao cidadeDao;
    
    @RemoteMethod
    public Collection<Cidade> getCidades(final Long idEstado) {
        if (idEstado == null) {
            return Collections.emptyList();
        }
        return cidadeDao.findByEstado(idEstado);
    }
}
