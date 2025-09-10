

lf = fs::dir_ls(path = ".",regexp = "chapter")

for (fi in lf){
    for (fj in fs::dir_ls(fi, glob = "*.Rmd")){
        curr = readr::read_lines(fj)
        curr = stringr::str_replace_all(string = curr,
                                 pattern = "ScPo-shield.png",
                                 replacement = "unito-shield.png")
        curr = stringr::str_replace_all(string = curr,
                                        pattern = "ScPoEconometrics",
                                        replacement = "Econometrics")
        curr = stringr::str_replace_all(string = curr,
                                        pattern = "Florian Oswald, Mylène Feuillade, Gustave Kenedi and Junnan He",
                                        replacement = "Florian Oswald")
        curr = stringr::str_replace_all(string = curr,
                                        pattern = "SciencesPo Paris </br>",
                                        replacement = "UniTo ESOMAS")
        curr = stringr::str_replace_all(string = curr,
                                        pattern = "ScPo-econ.png",
                                        replacement = "esomas.png")
        readr::write_lines(curr, fj)
        
    }
    
}
