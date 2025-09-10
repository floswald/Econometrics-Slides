

replace_logos <- function(){
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
    print("done")
}

render_all <- function(){
    lf = fs::dir_ls(path = ".",regexp = "chapter")
    
    for (fi in lf){
        for (fj in fs::dir_ls(fi, glob = "*.Rmd")){
            print(paste("doing", fj))
            rmarkdown::render(fj, 'xaringan::moon_reader')
        }
    }
    print("done")
}

clean_pdf_all <- function(){
    lf = fs::dir_ls(path = ".",regexp = "chapter")
    
    for (fi in lf){
        for (fj in fs::dir_ls(fi, glob = "*.pdf")){
            print(paste("doing", fj))
            file.remove(fj)
        }
    }
    print("done")
}

pdf_all <- function(){
    lf = fs::dir_ls(path = ".",regexp = "chapter")
    
    for (fi in lf){
        for (fj in fs::dir_ls(fi, glob = "*.Rmd")){
            fn = tools::file_path_sans_ext(fj)
            #print(paste("doing", fj))
            cmd = paste0("decktape ",paste0(fn,".html")," ",paste0(fn,".pdf")," --chrome-arg=--disable-web-security")
            print(cmd)
            system(cmd)
        }
    }
    print("done")
}

