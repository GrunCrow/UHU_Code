function Ytestknn = funcion_knn (Xtest,Xtrain,Ytrain,k)
    Ytestknn=zeros(size(Xtest,1),1);
    numDatosTrain=size(Xtrain,1);
    numVariables=size(Xtrain,2);
    numClases=length(unique(Ytrain));
    
    for i=1:numDatosTrain
        p=Xtest(i,:)';
        np=Xtrain';
        p_ampliada=repmat(p,1,numDatosTrain);
        [vectDist,ind]=sqrt(sum((p_ampliada-np).^2));
        
        vectorIndices=ind(1:k);
        clasesKNN=Ytrain(vectorIndices);
        
        if size(vectorIndices,1)==1
            YtestKnn(i)=Ytrain(vectorIndices);
        else

            clasesProm=unique(clasesKNN);
            conteoClasesProm=zeros(length(clasesProm,1));
            
            for j=1:max(clasesProm)
                conteoClasesProm(j)=sum(clasesKNN==clasesProm(j));
            end
            
            claseCandidata=find(conteoClasesProm==max(conteoClasesProm));

            if size(claseCandidata,1)==1
                Ytestknn(i)=claseCandidata(1);
            else
                for j=1:k
                    if ismember(clasesKNN(j),clasesProm)
                        break;
                    end
                end
                
                Ytestknn(i)=clasesKNN(j);
            end

        end
    end

end