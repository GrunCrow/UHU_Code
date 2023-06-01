function [vectorMedias,matrizCov,ProbabilidadPriori] = funcion_ajusta_LDA(X, Y)

   clasesUnicas = unique(Y);
   numClases = length(clasesUnicas);
   ProbabilidadPriori = zeros(size(clasesUnicas));
   [numDatos,numAtributos] = size(X);
   
   vectorMedias = zeros(numClases,numAtributos)';
  
   contador = 1; 
   matricesCov = [];

    % Para cada clase, calcularemos su media, su matriz de covarianzas y su
    % probabilidad a priori.
   for i = 1:numClases
       DatosClases = X(Y==clasesUnicas(i),:);
       vectorMedias(:,contador) = mean(DatosClases)';
       ProbabilidadPriori(contador) = size(DatosClases,1)/size(X,1);
       numDatos(contador) = size(DatosClases,1);
       contador = contador + 1;
       matricesCov = cat(size(X,1),matricesCov,cov(DatosClases));
   end    
    
   mAcumulada = zeros(size(matricesCov(:,:,1)));

   for i = 1:numClases
       mAcumulada = (numDatos(i)-1) * matricesCov(:,:,i) + mAcumulada;
   end
   
   matrizCov = mAcumulada/(size(Y,1)-size(clasesUnicas,1));
   
end
