<?php
//similarity distance
function similarity_distance($rating_matrix,$user1,$user2){
	$similar=array();
	$sum=0;
	foreach($rating_matrix[$user1] as $key=>$value){
		if(array_key_exists($key,$rating_matrix[$user2])){
			$similar[$key]=1;
		}
	}
		if($similar==0){
			return 0;
		}
		foreach($rating_matrix[$user1] as $key=>$value){
		if(array_key_exists($key,$rating_matrix[$user2])){
			//Euclidean distance
			$sum=$sum+pow($value-$rating_matrix[$user2][$key],2);
		}
	}
	return 1/(1+sqrt($sum));
}

function getRecommendation($rating_matrix,$person){
	$total=array();
	$totalsimilarity=array();
	$order=array();
	foreach ($rating_matrix as $anotherperson=>$value){
		if($anotherperson!=$person){
			$sim=similarity_distance($rating_matrix,$person,$anotherperson);
			foreach($rating_matrix[$anotherperson] as $key=>$value){
				if(!array_key_exists($key,$rating_matrix[$person])){
					if(!array_key_exists($key,$total)){
						$total[$key]=0;
					}
					//predict similarity
					$total[$key]+=$rating_matrix[$anotherperson][$key]*$sim;
					if(!array_key_exists($key,$totalsimilarity)){
						$totalsimilarity[$key]=0;
					}
					$totalsimilarity[$key]+=$sim;
				}
			}

		}
	}
	
	foreach($total as $key=>$value){
		//Normalization 
		$order[$key]=$value/$totalsimilarity[$key];
		
	}
	array_multisort($order,SORT_DESC);
		return $order;
}
?>