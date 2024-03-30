
pragma circom 2.1.5;

include "circomlib/circuits/poseidon.circom";


/// @title EmailNullifier
/// @notice An opinionated way of calculating the email nullifier
/// @notice nullifier = poseidon(poseidon(signature))
/// @param bitPerChunk The number of bits per chunk the signature is split into
/// @param chunkSize The number of chunks the signature is split into
/// @input signature The signature of the email
/// @output out The email nullifier
template EmailNullifier(bitPerChunk, chunkSize) {
    signal input signature[chunkSize];

    signal output out;

    signal signatureHash <== PoseidonLarge(bitPerChunk, chunkSize)(signature);

    out <== Poseidon(1)([signatureHash]);
}
