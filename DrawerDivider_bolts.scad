DividerWidth = 5.3;
HasPlugs = true;
BaseWidth = DividerWidth * 3;
TotalHeight = DividerWidth*2;
BaseHeight = 3;
DividerHeight = DividerWidth;
WallThickness = 1.4;

$fn=20;
difference(){    
    union(){        
        difference(){
            //initial "cube" to create plywood cutout and "ramps"
            cube([BaseWidth,DividerWidth+BaseHeight,TotalHeight]);
            //cutout for plywood
            translate([DividerWidth,-DividerWidth*.2,0]) {
                cube([DividerWidth,DividerWidth*1.4,TotalHeight],center=false);
                
            }
            
            //carve out "ramps"
            translate([BaseWidth,0,0]) {
                cylinder(TotalHeight*1.1,DividerWidth*.8,DividerWidth*.8,center=false);         
            }                     
           cylinder(TotalHeight*1.1,DividerWidth*.8,DividerWidth*.8,center=false);
        }
      //extend base
        union(){
            translate([-DividerWidth-1,DividerWidth*.8,0]){
               cube([DividerWidth+1,DividerWidth*.2+BaseHeight,TotalHeight]);
            }
            translate([BaseWidth,DividerWidth*.8,]){
                cube([DividerWidth+1,DividerWidth*.2+BaseHeight,TotalHeight]);
            }
        }    
    }
    //two screw countersinks
    translate([BaseWidth,DividerWidth*0.66,TotalHeight/2])rotate([-90,0,0]) {
         cylinder(2,3,3); 
    }
    translate([0,DividerWidth*0.66,TotalHeight/2])rotate([-90,0,0]) {
         cylinder(2,3,3);     
    } 
    //pilot holes
    translate([BaseWidth,DividerWidth+BaseHeight,TotalHeight/2])rotate([90,0,0]) {
        cylinder(BaseHeight*2,1.8,1.5);        
    }   
    translate([0,DividerWidth+BaseHeight,TotalHeight/2])rotate([90,0,0]) {
        cylinder(BaseHeight*2,1.8,1.5);        
    }   
}
module screw_countersunk(
        l=20,   //length
        dh = 6,   //head dia
        lh = 3,   //head length
        ds = 2.5,  //shaft dia
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2, $fn=20);
        polyhole(h=l, d=ds);
    }
}