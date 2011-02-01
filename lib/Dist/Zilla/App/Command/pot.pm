use 5.012;
use strict;
use warnings;

package Dist::Zilla::App::Command::pot;
# ABSTRACT: update i18n messages.pot file with new strings

use Dist::Zilla::App -command;
use File::Temp qw{ tempfile };
use Path::Class;

sub description {
"Update the messages.pot file with new i18n strings found in the
distribution modules.";
}

sub opt_spec {
    my $self = shift;
    return (
    );
}

sub execute {
    my ($self, $opts, $args) = @_;

    # build list of perl modules from where to extract strings
    my @pmfiles;
    dir("lib")->recurse( callback => sub {
        my $file = shift;
        push @pmfiles, $file if $file =~ /\.pm$/;
    } );

    # store this list
    my $tmp = File::Temp->new( UNLINK=>1 );
    $tmp->print( map { "$_\n" } @pmfiles );
    $tmp->close;


}

1;
__END__

=head1 SYNOPSIS

    $ dzil pot -m lib/LocaleData/Foo-Bar-messages.pot
    $ dzil pot


=head1 DESCRIPTION

This command will update the messages file used for internationalization
purposes, collecting all the new strings since last invocation.


=head1 SEE ALSO

You can find more information on this module at:

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/Dist-Zilla-App-Command-pot>

=item * See open / report bugs

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dist-Zilla-App-Command-pot>

=item * Git repository

L<http://github.com/jquelin/dist-zilla-app-command-pot>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dist-Zilla-App-Command-pot>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dist-Zilla-App-Command-pot>

=back

