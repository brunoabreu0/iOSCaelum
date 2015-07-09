//
//  Contato.m
//  iOSCaelum
//
//  Created by Bruno Abreu on 7/1/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *) description {
    return [NSString stringWithFormat: @"Nome: %@, Telefone: %@, E-mail: %@, Endereco: %@, Site: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSString *)title {
    return self.nome;
}

- (NSString *)subtitle {
    return self.email;
}

@end
