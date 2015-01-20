getPath <-function(startNode, steps=100, perStep=20, igraphObj=TRUE){
  flag=0
  branch=getRelated(startNode)
  edge=data.frame(sourceID=branch[,'sourceName'], id=branch[,'names'])[1:perStep,]
  nodes=branch[,'names']
 
 while(flag < steps){
    for(i in 1:length(nodes)){
      temp=getRelated(nodes[i])
      newleaf=data.frame(sourceID=temp[,'sourceName'], id=temp[,'names'])[1:perStep,]
      edge=rbind(edge, newleaf[-which(newleaf[,'id'] %in% edge[,'sourceID']),])  
     }
    toss=which(newleaf[,'id'] %in% edge[,'sourceID'])
    if(length(toss)>1){newnodes=newleaf[-which(newleaf[,'id'] %in% edge[,'sourceID']), 'id']}else{newnodes=newleaf[,'id']}
    nodes=newnodes
  flag=flag+1
  }
	if(igraphObj==TRUE){network=graph.edgelist(as.matrix(edge)); return(network)}
	if(igraphObj==FALSE){return(edge)}
}
