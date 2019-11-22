# TMRCA Estimation Program using Probability

# parents choosing function
ChooseParents <- function(n, list_p){
  for (i in 1:n) {
    list_p[[i]] <- sample(1:n, size=2, replace=TRUE)
  }
  return(list_p)
}

# descendants list update function
List_d_update <- function(n, list_d, list_p, list_d_temp) {
  for (i in 1:n) {
    v_c_aux <- IsChildren(i, n, list_p)

    list_d_temp[[i]] <- vector()

    for (j in v_c_aux){
      list_d_temp[[i]] <- union(list_d_temp[[i]], list_d[[j]])
    }
  }
  return(list_d_temp)
}

# checking children function
IsChildren <- function(i, n, list_p){
  vector_c <- vector()

  for (j in 1:n) {
    if (is.element(i, list_p[[j]])){
      vector_c <- append(vector_c, j)
    }
  }
  return(vector_c)
}

# checking for max local descendants
check_n_local <- function(list_d, n, n_local) {
  for (i in 1:n) {
    if (n_local < length(list_d[[i]])) {
      n_local <- length(list_d[[i]])
    }
  }
  return(n_local)
}

# MASTER FUNCION
index <- function(n) {

  # INITIALIZATION STEP AT THE BEGINNING
  # ------------------------------------
  # input pop size
  n <- 100

  # init descendants list and parents list
  list_d <- list()
  list_p <- list()
  # init temp descendants list
  list_d_temp <- list()
  # init descendants
  for (i in 1:n) {
    list_d[[i]] <- c(i)
  }
  # init tmrca
  tmrca <- 0
  # init largest number of descendants variable
  n_local <- 0
  # ------------------------------------

  # PROCESSING STEPS
  # ------------------------------------
  while (n_local != n) {
    list_p <- ChooseParents(n, list_p)
    list_d <- List_d_update(n, list_d, list_p, list_d_temp)
    n_local <- check_n_local(list_d, n, n_local)
    print(n_local)
    tmrca <- tmrca + 1
  }
  
  # cat("Latest generation containing MRCA: ", "\n")
  # print(list_d)
  # OUTPUT STEPS
  # ------------------------------------
  return(tmrca)
}

tmrca <- index(n)

for (i in 1:10000){
  tmrca <- tmrca + index(n)
}


cat("Time to MRCA is: ", tmrca/10000, "\n")

