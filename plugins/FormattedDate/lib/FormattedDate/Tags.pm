package FormattedDate::Tags;
use strict;

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
