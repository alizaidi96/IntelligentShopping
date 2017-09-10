/*******************************************************************************
 * Copyright 2013 Lars Behnke
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package AHC;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ClusterTest {

    private static Cluster cluster;
    
    public static void main(String[] args) {
    	//ClusterTest.setup();
    	ClusteringAlgorithm alg = new DefaultClusteringAlgorithm();
        cluster = alg.performClustering(SampleClusterData.DISTANCES, SampleClusterData.NAMES,
                new AverageLinkageStrategy());
        System.out.println(cluster.getChildren().get(0).getName());
        
        int leafs = cluster.countLeafs();
        assertEquals(6, leafs);
        
        int dist = (int) cluster.getTotalDistance();
        assertEquals(10, dist);
        
        System.out.println(leafs);
	}
    
//    @Before
//    public void setup() {
//        ClusteringAlgorithm alg = new DefaultClusteringAlgorithm();
//        cluster = alg.performClustering(SampleClusterData.DISTANCES, SampleClusterData.NAMES,
//                new AverageLinkageStrategy());
//        System.out.println(cluster.getName());
//    }
//    
//    @Test
//    public void testCountLeafs() throws Exception {
//        int leafs = cluster.countLeafs();
//        assertEquals(6, leafs);
//    }
//    
//    @Test
//    public void testGetTotalDistance() throws Exception {
//        int dist = (int) cluster.getTotalDistance();
//        assertEquals(10, dist);
//    }
}
