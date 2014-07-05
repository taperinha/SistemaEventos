/*
 * Copyright (c) 2009-2013 CPD-UFSM. All rights reserved.
 */
package br.esp.sysevent.web.ajax;

import br.esp.sysevent.core.model.Confraternista;
import br.esp.sysevent.core.model.Sexo;
import br.esp.sysevent.core.service.ConfraternistaService;
import br.ojimarcius.commons.util.NumberUtils;
import br.ojimarcius.commons.util.CharSequenceUtils;
import java.util.Collection;
import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Giuliano Ferreira <giuliano@ufsm.br>
 */
@Service
public class ConfraternistaAjaxService {

    @Autowired
    private ConfraternistaService confraternistaService;

    public Collection<Confraternista> findByNome(final String nome) {
        if (CharSequenceUtils.isBlank(nome)) {
            return Collections.emptyList();
        }
        return confraternistaService.findByNome(nome);
    }
    
    public Collection<Confraternista> findByIdDormitorio(final String idDormitorio) {
        if (CharSequenceUtils.isBlank(idDormitorio)) {            
            return Collections.emptyList();
        }        
        return confraternistaService.findByDormitorio(NumberUtils.parseLong(idDormitorio));
    }
    
    public Collection<Confraternista> findSemDormitorio(String genero) {
        if (CharSequenceUtils.isBlankOrNull(genero)) {            
            return null;
        }else{
            if (genero.equals(Sexo.MASCULINO.getDescricao())){
                return confraternistaService.findBySexoSemDormitorio(Sexo.MASCULINO);
            }
            return confraternistaService.findBySexoSemDormitorio(Sexo.FEMININO);    
        }        
    }
}
