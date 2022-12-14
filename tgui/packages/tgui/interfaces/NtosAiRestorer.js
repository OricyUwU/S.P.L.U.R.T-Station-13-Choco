import { NtosWindow } from '../layouts';
import { AiRestorerContent } from './AiRestorer';

export const NtosAiRestorer = () => {
  return (
    <NtosWindow
      width={370}
      height={400}>
      <NtosWindow.Content overflow="auto">
        <AiRestorerContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
