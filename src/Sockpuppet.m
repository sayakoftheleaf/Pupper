#import "Sockpuppet.h"



@implementation Sockpuppet




- (void)setup:(NSString *)ip port:(int)port{
    NSURL *url = [NSURL URLWithString:ip];
    
    NSLog(@"Setting up connection to %@ : %i", [url absoluteString], port);
    
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, (__bridge CFStringRef)[url host], port, &readStream, &writeStream);
    
    if(!CFWriteStreamOpen(writeStream)) {
        NSLog(@"Error, writeStream not open");
        
        return;
    }
    [self open];
    
    NSLog(@"Status of outputStream: %lu", (unsigned long)[outputStream streamStatus]);
    NSLog(@"Status of inputStream: %lu", (unsigned long)[inputStream streamStatus]);
    
    return;
}

- (void)open {
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    
    [inputStream open];
    [outputStream open];
    
    
}

- (void)close {
    
    [inputStream close];
    [outputStream close];
    
    [inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream setDelegate:nil];
    [outputStream setDelegate:nil];
    
    
    inputStream = nil;
    outputStream = nil;
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)event {
   // NSLog(@"Stream triggered.");
//    NSLog(@"########");
 //   NSLog(@"Stream is sending an Event: %lu", (unsigned long)event);
    if(stream == outputStream) {
 //       NSLog(@"output STREAM.");
        
    }
    if(stream == inputStream) {
   //     NSLog(@"input STREAM.");
        
    }
    switch(event) {
        case NSStreamEventHasSpaceAvailable: {
            if(stream == outputStream) {
          //      NSLog(@"outputStream is ready.");
                
            }
            if(stream == inputStream) {
           //     NSLog(@"inputStream is ready.");
                
                uint8_t buf[1024];
                unsigned int len = 0;
                
                len = [inputStream read:buf maxLength:1024];
                
                if(len > 0) {
                    NSMutableData* data=[[NSMutableData alloc] initWithLength:0];
                    
                    [data appendBytes: (const void *)buf length:len];
                    
                    NSString *s = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                    
                    [self readIn:s];
                    
                    //    [data release];
                }
            }
            break;
        }
        case NSStreamEventOpenCompleted: {
            break;
        }
        case NSStreamEventErrorOccurred: {
            NSLog(@"Event error occured");
            break;
        }
        case NSStreamEventNone: {
            NSLog(@"Event none!");
            break;
        }
        case NSStreamEventEndEncountered: {
            NSLog(@"event end encountered");
            break;
        }
        case NSStreamEventHasBytesAvailable: {
            if(stream == inputStream) {
              //  NSLog(@"inputStream is ready.");
                
                uint8_t buf[1024];
                unsigned int len = 0;
                
                len = [inputStream read:buf maxLength:1024];
                
                if(len > 0) {
                    NSMutableData* data=[[NSMutableData alloc] initWithLength:0];
                    
                    [data appendBytes: (const void *)buf length:len];
                    
                    NSString *s = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                    
                    [self readIn:s];
                    
                    //    [data release];
                }
            }
            break;
        }
        default: {
       
            if (stream == inputStream){
                NSLog(@"INPUT STREAM RETURNED ERROR");
                NSError *theError = [inputStream streamError];
                NSLog(@"%@", [NSString stringWithFormat:@"Error %li: %@",
                              (long)[theError code], [theError localizedDescription]]);
            }
            else if (stream == outputStream){
                NSLog(@"Output stream returned error");
                NSError *theError = [inputStream streamError];
                NSLog(@"%@", [NSString stringWithFormat:@"Error %li: %@",
                              (long)[theError code], [theError localizedDescription]]);
            }
            break;
        }
    }
}



- (void)readIn:(NSString *)s {
    
    
    // INSERT MAIN HANDLER HERE
    // string "s" is the input
    
}

- (void)writeOut:(NSString *)s {
    uint8_t *buf = (uint8_t *)[s UTF8String];
    
    [outputStream write:buf maxLength:strlen((char *)buf)];
    
   // NSLog(@"Writing out the following:");
   // NSLog(@"%@", s);
    
    
}



@end