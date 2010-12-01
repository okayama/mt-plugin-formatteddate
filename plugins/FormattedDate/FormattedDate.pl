package MT::Plugin::FormattedDate;
use strict;
use MT;
use MT::Plugin;
@MT::Plugin::FormattedDate::ISA = qw( MT::Plugin );

our $VERSION = "1.0.0";

my $plugin = new MT::Plugin::FormattedDate( {
    id => 'FormattedDate',
    key => 'formatteddate',
    name => 'FormattedDate',
    author_name => 'okayama',
    author_link => 'http://weeeblog.net/',
    description => '<MT_TRANS phrase=\'_PLUGIN_DESCRIPTION\'>',
	version => $VERSION,
    l10n_class => 'FormattedDate::L10N',
} );

MT->add_plugin( $plugin );

sub init_registry {
    my $plugin = shift;
    $plugin->registry( {
        tags => {
            function => {
                'FormattedDate' => \&_hdlr_formatted_date,
            },
        },
   } );
}

######################################### Mainroutine #########################################

sub _hdlr_formatted_date {
    my ( $ctx, $args, $cond ) = @_;
    my $value;
    if ( exists $args->{ tag } ) {
        $args->{ tag } =~ s/^MT:?//i;
        $value = $ctx->tag( $args->{ tag }, $args, $cond );
    } elsif ( exists $args->{ name } ) {
        $value = $ctx->var( $args->{ name } );
    } elsif ( exists $args->{ var } ) {
        $value = $ctx->var( $args->{ var } );
    }
    if ( defined( $value ) && $value ne '' ) {
        $value =~ s/\D//g;
        if ( $value =~ /^[0-9]{14}$/ ) {
            $args->{ ts } = $value;
            return $ctx->build_date( $args );
        }
    }
    return '';
}

1;



