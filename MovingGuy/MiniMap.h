//
//  MiniMap.h
//  MovingGuy
//
//  Created by Taylor Solon on 7/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MiniMap : CCLayerColor {
    
}

-(void) fill: (int)xSize :(int)ySize :(int)xNow :(int)yNow;

@end
