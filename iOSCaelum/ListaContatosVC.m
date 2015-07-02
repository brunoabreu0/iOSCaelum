//
//  ListaContatosVC.m
//  iOSCaelum
//
//  Created by ios4729 on 02/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ListaContatosVC.h"
#import "FormularioContatoVC.h"

@implementation ListaContatosVC

- (id) init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
    }
    return self;
}

- (void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoVC *form = [storyboard instantiateViewControllerWithIdentifier:@"FormContato"];
    [self.navigationController pushViewController:form animated:YES];
}

@end
