length=50;
angle = 50;
width = 7;
ledwidth=10.4;
thickness=2;
height = ledwidth+thickness+thickness;
lip=1.5;
joinery=1;
fn = 360;

radius = 180*length/angle/PI;

module channel(height, width){
    union(){    
        polygon(points = [
        [0,height],
        [0,0],
        [width,0],
        [width,thickness+lip],
        [width-thickness,thickness+lip],
        [width-thickness,thickness],
        [thickness,thickness],
        [thickness,height-thickness],
        [width-thickness,height-thickness],
        [width-thickness,height-thickness-lip],
        [width,height-thickness-lip],
        [width,height]
        ]);
    square(r=2)
    }
}
if(angle==0){
    translate([0,length,0]){        
        rotate([90,0,0]){
            linear_extrude(height=length)
            channel(height,width);
        }    
    }
}
else{
    translate([-radius,0,0]){    
        rotate_extrude(angle=angle,convexity=10,$fn=360)
        translate([radius,0,0]){
          channel(height,width);
        }  
    } 
}


