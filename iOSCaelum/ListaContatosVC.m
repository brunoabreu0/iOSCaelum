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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDao contatoDaoInstance];
    }
    return self;
}

- (void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoVC *form = [storyboard instantiateViewControllerWithIdentifier:@"FormContato"];
    [self.navigationController pushViewController:form animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao.contatos count];
}

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identificador = @"celula";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identificador];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Contato *contato = [self.dao buscaContatoDaPosicao: indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao removeContatoDaPosicao: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
