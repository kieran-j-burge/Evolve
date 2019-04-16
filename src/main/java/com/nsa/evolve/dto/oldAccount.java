package com.nsa.evolve.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class oldAccount {

    private Integer id;
    private String password;
    private String salt;


}
