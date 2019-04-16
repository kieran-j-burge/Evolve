package com.nsa.evolve.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Assessment {

    private Integer id;
    private Date date;
    private Integer approved;
    private Integer qviScore;
    private Integer fkCompany;

    public Assessment(Date date, Integer approved, Integer qviScore, Integer fkCompany) {
        this.date = date;
        this.approved = approved;
        this.qviScore = qviScore;
        this.fkCompany = fkCompany;
    }
}