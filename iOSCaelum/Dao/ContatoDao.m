//
//  ContatoDao.m
//  iOSCaelum
//
//  Created by ios4729 on 02/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao *defaultDao = nil;

- (void) adicionaContato:(Contato *)contato {
    [self.contatos addObject: contato];
    NSLog(@"Contatos: %@", self.contatos);
}

- (id) init {
    self = [super init];
    if (self) {
        _contatos = [NSMutableArray new];
    }
    return self;
}

+ (id) contatoDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContatoDao new];
    }
    return defaultDao;
}

- (Contato *) buscaContatoDaPosicao:(NSInteger)posicao {
    return self.contatos[posicao];
}

- (void) removeContatoDaPosicao:(NSInteger)posicao {
    [self.contatos removeObjectAtIndex:posicao];
}


@end
