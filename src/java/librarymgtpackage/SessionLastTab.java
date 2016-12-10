/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.Serializable;
/**
 *
 * @author Samintha
 */
public class SessionLastTab implements Serializable{
    
    String tabid;
    
    public SessionLastTab(){
        tabid = "tabdisplay";
    }

    public String getTabid() {
        return tabid;
    }

    public void setTabid(String tabid) {
        this.tabid = tabid;
    }
}
